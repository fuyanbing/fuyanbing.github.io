/**
 * @FileName localStorage
 * @Date: 2017-17/11/02
 * @Author: Junior
 */
export default {
    set(key, value) {
        if (!window.localStorage) {
            console.error("localStorage 不可用！")
            return
        }
        localStorage.setItem(key, JSON.stringify(value))
    },
    get(key) {
        let value = localStorage.getItem(key)
        if (!value) {
            console.error(key + "不存在！")
            return
        }
        return JSON.parse(value)
    },
    clear(key) {
        localStorage.clear(key)
    }
}