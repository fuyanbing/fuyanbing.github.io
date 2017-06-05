<?php
/**
 * MYSQL 公用类库
 * @version 1.0
 */
class db_mysql{
	/**
	 * $debug=true  打开数据库调试模式
	 * $debug=false  关闭数据库调试模式
	 * 
	 * @var boolean
	 */
	public $debug = false;
	private $version = "";
	private $link_id = NULL;
	
	/**
	 * 构造函数
	 */
	function __construct() {
		$this->debug = false;
	}
	
	/**
	 * 连接数据库
	 * string $dbhost			数据库主机名
	 * string $dbuser			数据库用户名
	 * string $dbpwd			数据库密码
	 * string $dbname			数据库名称
	 * string $dbcharset		数据库字符集
	 * string $pconnect			持久连接，1为开启，0为关闭
	 * return bool
	 */
	function connect($dbhost, $dbuser, $dbpwd, $dbname = '', $dbcharset = 'utf-8', $pconnect =0){
		if($pconnect){
			//如果要是创建持久连接
			//调用mysql_pconnect创建一个持久连接
			if(! $this-> link_id = mysql_pconnect($dbhost,$dbuser,$dbpwd)){
				$this -> ErrorMsg();  //如果连接创建失败则输出错误消息
			}
		}else{
			//如果不是创建持久连接
			//调用mysql_connect来创建一个非持久连接
			if(! $this-> link_id = mysql_connect($dbhost,$dbuser,$dbpwd,1)){
				$this -> ErrorMsg();  //如果连接创建失败则输出错误消息
			}
		}
		//获取连接的版本信息
		$this->version = mysql_get_server_info($this->link_id);
		//如果MySQL的版本大于4.1
		if($this->getVersion()>'4.1'){
			if($dbcharset){
				mysql_query("SET character_set_connection=".$dbcharset.",character_set_results=".$dbcharset.",character_set_client=binary",$this->link_id);
			}
			//如果版本大于5.0.1,则设置sql_mode
			if($this->getVersion()>'5.0.1'){
				mysql_query("SET sql_mode=''",$this->link_id);
			}
		}
		//选中指定的数据库
		if(mysql_select_db($dbname,$this->link_id)===false){
			$this->ErrorMsg();
		}
	}
	
	/**
	 * 发送一条 MySQL 查询
	 *
	 * @param string $sql   所要执行的SQL语句
	 * @return bool         如果查询执行成功，则返回查询结果集，否则返回flase
	 */
	function query($sql){
		if($this->debug) echo "<pre><hr>\n".$sql."\n<hr></pre>";//如果设置成调试模式，将打印SQL语句
		if(!($query=mysql_query($sql,$this->link_id))){
			$this->ErrorMsg();
			return false;
		}else{
			return $query;
		}
	}
	
	/**
	 * 插入数据
	 *
	 * @param string $table			表名<br />
	 * @param array $field_values	要插入的值数据数组<br />
	 * @return id					返回最后插入ID
	 */
	
	function insert($table,$field_values){
		$field_names = $this -> getCol('DESC'.$table);  //使用DESC+表名查询字段信息
		$fields = array();		//定义字段数组
		$values = array();		//定义值数组
		foreach($field_names as $value){ //循环字段结果集数组
			//如果指定的字段已经存在于$field_values关联数组的键或索引中
			if(array_key_exists($value,$field_values)==true){
				$fields [] = $value;	//将改值赋给字段数组元素
				$values [] = "'".$field_values [$value] . "'";//将值添加到值列表
			}
		}
		if(! empty($fields)){
			//如果字段列表不为空  根据字段数组和值数组的元素构建INSERT语句，implode用来将数组元素变成以逗号分隔的字符串
			$sql = 'INSERT INTO '.$table.' ('.implode (', ',$fields ). ') VALUES ('.implode ( ', ',$values ). ')';
		}
		
		if($sql){
			$this -> query($sql);	//执行查询
			return $this->getInsertId();	//返回自增字段的值
		}else{
			return false;
		}
	}
	
	/**
	 * 获取刚插入数据的ID
	 */
	function getInsertId(){
		return mysql_insert_id($this->link_id);
	}
	
	/**
	 * 更新数据
	 *
	 * @param string $table			要更新的表<br />
	 * @param array $field_values	要更新的数据，传字字段和值关联数组:array('字段1'=>'字段值1','字段2'=>'字段值2')
	 * @param string $where 		更新条件
	 * @return bool	
	 */	
	function update($table,$field_values,$where=''){
		$field_names=$this->getCol('DESC'.$table);//获取字段列数组
		$sets = array();	//定义更新数组
		foreach($field_names as $value){ //循环字段列数组
		//如果指定的字段已经存在于$field_values的键中
			if(array_key_exists($value,$field_values)==true){
				//构造'字段=值'这样的语句数组格式
				$sets [] = $value ." = '".$field_values [$value]."'";
			}
		}
		if(! empty($sets)){
			//判断是否成功构建了字段列表  构建UPDATE语句
			$sql = 'UPDATE '.$table.' SET '.implode(', ',$sets) .' WHERE '.$where;
		}
		
		if($sql){
			return $this -> query($sql);	//执行查询
		}else{
			return false;
		}
	}
	
	/**
	 * 删除数据
	 *
	 * @param string $table	要删除的表<br />
	 * @param string $where	删除条件，默认删除整个表
	 * @return bool
	 */
	function delete($table,$where=''){
		if(empty($where)){  		//如果没有传入$where参数
			$sql = 'DELETE FROM '.$table;		//则对整个表进行删除
		}else{
			$sql = 'DELETE FROM '.$table.' WHERE '.$where;	
		}
		if($this->query ( $sql )){                        //执行SQL语句并返回查询结果
			return true;
		}else{
			return false;
		}
	}
	
	/**
	 * 获取数据列表
	 *
	 * @param string $sql	查询语句
	 * @return array		二维数组
	 */
	function getList($sql){
		$res = $this -> query($sql);  //调用query查询数据库并返回查询结果
		if($res !== false){		//如果查询执行成功
			$arr = array ();                     //定义一个数组
			$row = mysql_fetch_assoc ( $res );   //提取第1行数据
			while($row){ 			//如果成功提取到数据
				$arr [] =$row;		//将行赋给数组中的元素
				$row = mysql_fetch_assoc($res);
			}
			return $arr;
		}else{
			return false;
		}
	}
	
	/**
	 * 获取数据列表
	 *
	 * @param string $sql	查询语句<br />
	 * @param int $numrows	返回个数<br />
	 * @param int $offset	指定偏移量
	 * @return array		二维数组
	 */
	
	function selectLimit($sql, $numrows=-1, $offset=-1) {
		if($offset==-1){
			$sql .= ' LIMIT ' . $numrows;
		}else{
			$sql .= ' LIMIT ' . $offset . ', ' . $numrows;
		}
		return $this->getList( $sql );
	}
	/**
	 * 获取一条记录
	 *
	 * @param string $sql	查询语句
	 * @return array		一维数组
	 */	
	function getOneRow($sql) {
		$res = $this->query ( $sql );
		if ($res !== false) {
			return mysql_fetch_assoc ( $res );
		} else {
			return false;
		}
	}
	/**
	 * 返回查询记录数
	 *
	 * @return int
	 */
	function getRowsNum($sql) {
		$query = $this->query ( $sql );
		return mysql_num_rows ( $query );
	}
	/**
	 * 返回查询的结果的第一个数据
	 *
	 * @return string
	 */	
	function getOneField($sql){
		$val = mysql_fetch_array($this->query ( $sql ));
		return $val[0];
	}
	/**
	 * 获取列
	 *
	 * @param string $sql
	 * @return array
	 */
	function getCol($sql) {
		$res = mysql_query ( $sql );
		if ($res !== false) {
			$arr = array ();
			$row = mysql_fetch_row ($res);
			while ($row) {
				$arr [] = $row [0];
				$row = mysql_fetch_row ($res);
			}
			return $arr;
		} else {
			return false;
		}
	}
	
	/**
	 * 关闭数据库连接（通常不需要，非持久连接会在脚本执行完毕后自动关闭）
	 */
	function close() {
		return mysql_close ( $this->link_id );
	}
	/*获取数据库版本信息*/
	function getVersion() {
		return $this->version;
	}
	/*数据库报错处理*/
	function ErrorMsg($message = '') {
		if ($message) {
			echo $message;
		} else {
			echo @mysql_error ();
		}
		exit ();
	}
}
?>