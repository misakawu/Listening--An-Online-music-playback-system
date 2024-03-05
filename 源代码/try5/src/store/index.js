/*vuex配置*/
import Vue from "vue";
import Vuex from "vuex";
Vue.use(Vuex);

const store = new Vuex.Store({
    state: {
        // 如果在组件中，想要访问store中的数据，只能通过 this.$store.state.*** 来访问
        isCollapse: false, //左侧菜单是否折叠
        taglist: [{ "menuid": 1, "path": "/index", "name": "index", "lable": "首页", "icon": "el-icon-house", "children": [] }] //标签数组
    },
    mutations: {
        //如果组件想要调用 mutations中的方法，只能使用this.$store.commit('方法名')
        collapse(state) {
            state.isCollapse = !state.isCollapse;
        },
        //添加标签到集合中
        selectMenu(state, value) {
            if (value.name != "index") {
                const result = state.taglist.findIndex(
                    item => item.name === value.name
                );
                if (result === -1) {
                    state.taglist.push(value);
                }
            }
        },
        //删除集合中的标签
        closeTag(state, value) {
            const result = state.taglist.findIndex(item => item.name === value.name);
            state.taglist.splice(result, 1);
        }
    },
    actions: {},
    getters: {
        //这里只负责对外提供数据，不负责修改数据，如果想要修改state中的数据，请去找mutations
    }
});

export default store;

