<?php
/**
 * MYSQL 公共类库
 * @version 1.0
 */
class db_mysql{
	/**
	 * $debug=true  打开数据库调试模式
	 * @var boolean
	 */
	public $debug = false;
	private $version ="";
	private $link_id = NULL;
	
	/*
	 * 构造函数
	 */
	function __construct(){
		$this->debug = false;
	}
	
	/*
	 * 连接数据库
	 * 
	 * $dbhost 数据库主机名
	 * $dbuser 数据库用户名
	 * $dbpwd 数据库密码
	 * $dbname 数据库名称
	 * $dbcharset 数据库字符集
	 * $pconnect 持久连接，1为开启，0为关闭
	 */
	function connect($dbhost, $dbuser,$dbpwd,$dbname = '',$dbcharset='utf8',$pconnect=0){
		if($pconnect){//创建持久连接
			//调用mysql_pconect创建一个持久连接
			if(! $this->link_id = mysql_pconnect($dbhost,$dbuser,$dbpwd)){
				$this->ErrorMsg();
			}
		}else{
			//调用mysql_pconect创建一个持久连接
			if(! $this->link_id = mysql_connect($dbhost,$dbuser,$dbpwd,1)){
				$this->ErrorMsg();
			}
		}
		//获取连接的版本信息
		$this->version = mysql_get_server_info($this->link_id);
		//如果MySQL的版本大于4.1
		if($this->getVersion()>'4.1'){
			if($dbcharset){
				//下面的代码用来设置连接的字符集类型
				mysql_query("SET character_set_connection=".$dbcharset.", character_set_results=".$dbcharset.",character_set_client=binary",$this->link_id);
			}
			//如果版本 大于5.0.1，则设置sql_mode
			if($this->getVersion()>'5.0.1'){
				mysql_query("SET sql_mode=''",$this->link_id);
			}
		}
		//选中制定的数据库
		if(mysql_select_db($dbname,$this->link_id)===false){
			$this->ErrorMsg();
		}
	}
	
	/*
	 * 发送一条MySQL查询
	 * $sql 所要执行的SQL语句
	 * 如果查询执行成功，则返回查询结果集，否则返回flase
	 */
	function query($sql){
		if($this->debug) echo "<pre><hr>\n".$sql."\n<hr></pre>";//如果设置调试模式，将打印SQL语句
		if(!($query = mysql_query($sql,$this->link_id))){
			$this->ErrorMsg();
			return false;
		}else{
			return $query;
		}
		
	}
	
	/*
	 * 
	 * 插入数据
	 * 
	 * $table 表名
	 * $field_values 要插入的数值数组<br/>
	 * id 返回最后插入的ID
	 */
	function insert($table,$field_values){
		
		$field_names = $this->getCol('DESC'.$table);//使用DESC+表名查询 字段信息
		$fields = array();//定义字段数组
		$values = array();//定义值数组
		foreach($field_names as $value){
			//循环字段结果集数组
			//如果指定的字段已经存在于$field_values关键数组的键或索引中
			if(array_key_exists($value,$field_values) == true){
				$fields[] = $value;//将值赋给字段数组元素
				$values[] = "'".$field_values[$value]."'";//将值添加到值列表
			}
		}
		if(! empty($fields)){
			//如果列表字段不为空
			//根据字段数组和值数组的元素构建INSERt语句，implode用来将数组元素变成以逗号分隔的字符串
			//$sql = "INSERT INTO `php`.`guestbook` (`id`, `title`, `content`, `name`, `time`) VALUES (NULL, '汉子', '333333333333333', '333333333333', now())";
			$sql = 'INSERT INTO '.$table.'('.implode (',', $fields).') VALUES (' .implode ( ',' ,$values).')';
		}
		if ($sql) {
			$this->query ( $sql );  //执行查询
			return $this->getInsertId ();   //返回自增字段
		}else{
			return false;
		}
	}
	
	/**
	 * 获取刚插入数据的ID
	 */
	function getInsertId(){
		return mysql_insert_id ($this->link_id);
	}
	
	/*
	 * 更新数据
	 * 
	 * string $table  要更新的表
	 * array $field_values  要更新的数据，传字段和值关联数组:array('字段1'=>'字段值1','字段2'=>'字段值2')
	 * string $where 更新条件
	 * bool
	 */
	function update($table,$field_values,$where = ''){
		$field_names= $this -> getCol('DESC'.$table);//获取字段列数组
		$sets = array();//定义更新数组
		foreach($field_names as $value){//循环字段列数组
			//如果字段存在于传入的$field_values的键中
			if(array_key_exists($value,$field_values)==true){
				//构建“字段=值”这样的语句数组格式
				$sets [] =$value." = '".$field_values[$value]."'";
			}
		}
		if(! empty($sets)){
			//判断是否成功构建了字段列表 //构建UPDATE语句
			$sql = 'UPDATE '.$table.' SET '.implode(',', $sets).') WHERE ' .$where;
		}
		if ($sql){
			return $this->query ( $sql );  //执行更新语句
		}else{
			return false;
		}
		
	}
	
	
	
	
	/*
	 * 删除数据
	 * string $table 要删除的表
	 * string $where 删除条件，默认删除整个表
	 */
	function delete($table,$where=''){
		if(empty($where)){
			$sql = 'DELETE FROM '.$table; 		//如果没有传入$where参数
		}else{
			$sql = 'DELETE FROM '.$table.' WHERE '.$where; //否则仅删除指定条件的记录
		}
		if($this->query($sql)){  //执行SQL语句并返回查询结果
			return true;
		}else{
			return false;
		}
	}
	
	/*
	 * 获取数据列表
	 * string $sql 查询语句
	 * array 二维数组
	 */
	function getList($sql){
		$res = $this -> query($sql);	//调用query查询数据库并返回查询结果
		if($res !== false){				//如果查询成功执行
			$arr = array();				//定义一个数组
			$row = mysql_fetch_assoc($res);//提取第一行数据
			while($row){				//如果成功提取到数据
				$arr[] = $row;			//将行赋给数组中的元素
				$row = mysql_fetch_assoc($res);
			}
			return $arr;				//执行完成返回数组
		}else{
			return false;				//否则返回false
		}
	}
	
	/*
	 * 获取数据列表
	 * string $sql 查询语句
	 * int $numrows 返回个数
	 * int $offset  指定偏移量
	 * array 二维数组
	 */
	function selectLimit ($sql, $numrows = -1,$offset = -1){
		if($offset == -1){
			$sql .= ' LIMIT '.$numrows;
		}else{
			$sql .= ' LIMIT '.$offset.','.$numrows;
		}
		return $this -> getList($sql);
	}
	
	/*
	 * 获取一条记录
	 * string $sql 查询语句
	 * array 一维数组
	 */
	function getOneRow($sql){
		$res = $this -> query($sql);
		if($res !== false){
			return mysql_fetch_assoc($res);
		}else{
			return false;
		}
	}
	
	/*
	 * 返回查询记录数
	 * int
	 */
	function getRowsNum($sql){
		$query = $this -> query($sql);
		return mysql_num_rows($query);
	}
	
	/*
	 * 返回查询结果的第一个数据
	 * string
	 */
	function getOneField($sql){
		$val = mysql_fetch_array($this -> query($sql));
		return $val[0];
	}
	
	/*
	 * 获取列
	 * string $sql
	 * array
	 */
	function getCol($sql){
		$res = mysql_query($sql);
		if($res !== false){
			$arr = array();
			$row = mysql_fetch_row($res);
			while($row){
				$arr[] = $row[0];
				$row = mysql_fetch_row($res);
			}
			return $arr;
		}else{
			return false;
		}
	}
	
	/*
	 * 关闭数据库连接（通常不需要，非持久连接会在脚本执行完毕后自动关闭）
	 */
	function close(){
		return mysql_close( $this -> link_id);
	}
	
	/*
	 * 获取数据库版本信息
	 */
	function getVersion(){
		return $this ->version;
	}
	
	/*
	 * 数据库报错处理
	 */
	function ErrorMsg($message = ''){
		if($message){
			echo $message;
		}else{
			echo @mysql_error();
		}
		exit();
	}
	
}

?>