import { mapActions, mapGetters } from 'vuex';
export default {
    data() {
        return {
            siteUri: 'http://bookingmarket.localhost/',
            selectdata:'',
           

        }
    },
    computed: {
        ...mapGetters({

            authUser:'getAuthUser',
            isLoggedIn:'getIsLoggedIn',

        }),
    },
    filters:{
        formatProgressparcent(item){
            // console.log(item);
            let assign_task_for_completed = 0
            if(item.assign_task_for_completed != null) assign_task_for_completed = item.assign_task_for_completed.totalestimated_time;

            let progress = 0
            if(item.assign_task != null) progress = Math.floor((assign_task_for_completed*100) / item.assign_task.totalestimated_time);
           
            return progress;
        },
        userformatProgressparcent(item){
            // console.log(item);
            let assign_task_for_completed = 0
            if(item.projects.assign_task_for_completed != null) assign_task_for_completed = item.projects.assign_task_for_completed.totalestimated_time;

            let progress = 0
            if(item.projects.assign_task != null) progress = Math.floor((assign_task_for_completed*100) / item.projects.assign_task.totalestimated_time);
           
            return progress;
        },
        attendanceParcent(item){
            let hours = 0
            if(item !== null) hours = Math.floor((item*100) / 26);
           
            return hours;
        },
        workingParcent(item){
            let hours = 0
            if(item !== null) hours = Math.floor((item*100) / 480);
           
            return hours;
        },
        formatTime(item){
        let hours = Math.floor(item / 60);
          let minutes = item % 60;
          let time  = hours + ' hours :'+minutes+" minutes"
          return time;
        },
        formatCreated(item){
            var today = new Date(item);
            var dd = String(today.getDate()).padStart(2, '0');
            var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
            var yyyy = today.getFullYear();
            
            today = dd + '-' + mm + '-' + yyyy;
            return today
        },
        esLeaveTime(item){
            if(item.entry_time){
                let time   = 540;
                var dt = new Date("01/01/2007 "+ item.entry_time);
                console.log(dt)
               let outTime = 0
                if(item.outings){
                    for(let d of item.outings){
                        outTime += d.duration
                    }
                }
                
                if(item.duration_of_break > 60) {
                    outTime += parseInt(item.duration_of_break)  - 60
                }
                if(outTime > 20){
                    outTime = outTime - 20
                    time = time + outTime
                }
                dt.setMinutes(dt.getMinutes() + time);
                var timestamp = dt.getHours() + ":" + dt.getMinutes()
                var timeString = timestamp;
                var H = +timeString.substr(0, 2);
                var h = H % 12 || 12;
                var ampm = (H < 12 || H === 24) ? "AM" : "PM";
                timeString = h + timeString.substr(2, 3) + ampm;
                console.log(timeString)
                return timeString;

            }
            return "Please add Entry Time"
        
        }
    },
    methods: {
        /**
         * 
         * @param {*} method, call method
         * @param {*} url , api url
         * @param {*} dataObj, payload
         */
        async callApi(method, url, dataObj) {
            try {

                let data = await axios({
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json',
                    },
                    method: method,
                    url: '/app/' + url,
                    data: dataObj
                })
                return data

            } catch (e) {

                return e.response
            }
        },
        // async callApi(method, url, dataObj) {
        //     try {

        //         let data = await axios({
        //             headers: {
        //                 'Accept': 'application/json',
        //                 'Content-Type': 'application/json',
        //             },
        //             method: method,
        //             url: '/user/app/' + url,
        //             data: dataObj
        //         })
        //         return data

        //     } catch (e) {

        //         return e.response
        //     }
        // },

        i(msg, i = 'Hey!') {
            this.$Notice.info({
                title: i,
                desc: msg
            });
        },
        s(msg, i = 'Great!') {
            this.$Notice.success({
                title: i,
                desc: msg
            });
        },
        w(msg, i = 'Hi!') {
            this.$Notice.warning({
                title: i,
                desc: msg
            });
        },
        e(msg, i = 'Oops!') {
            this.$Notice.error({
                title: i,
                desc: msg
            });
        },
        swr() {
            this.$Notice.error({
                title: 'Oops',
                desc: 'Something went wrong, please try again later'
            });
        },
        ns(title) {
            this.$Message.success(title);
        },
        ni(title) {
            this.$Message.info(title);
        },
        nw(title) {
            this.$Message.warning(title);
        },
        ne(title) {
            this.$Message.error(title);
        },
        nswr() {
            this.$Message.error('Something went wrong, please try again later');
        },
    }
} 