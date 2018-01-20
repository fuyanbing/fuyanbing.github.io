import axios from '@axios'
import contapi from '@commonJS/const'

export function saveImgListServer(obj){
	const data = {
		json:{
			headSchoolId : "5a0044644828d410b4b07315",
			teacherId:"5a139542a3fe6610bc78fb14",
			introImages:obj,
		}
	}
	return axios.post(contapi.interconnection+"/v1/teacherIntro/saveTeacherIntro?accessToken=aaaa", data)
}
export function findImgListServer() {
	const data = {
		headSchoolId : "5a0044644828d410b4b07315"
	}
	return axios.post(contapi.interconnection+"/v1/teacherIntro/findTeacherIntroList?accessToken=aaaa", data)
}