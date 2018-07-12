//Vue.http.headers.common['X-CSRF-TOKEN'] = window.csrfToken;

var App = new Vue({
  el: '.App',
  data: {
    Projects: [],
    addItem_Title: '',
    selectProject: ''
  },
  methods: {
    
    getProjects() {
      if (this.Projects.length === 0) {
        this.$http.get('/projects').then(res => {
          console.log(res.body)
          this.Projects = res.body
        },
        res => {
          console.error(res)
        })
      }
    },
    
    onCheckChanged(evt, project_id, todo) {
      console.log(evt, todo) 
       
       this.$http.post('/projects/'+ project_id + '/todos/' + todo.id , {todo: todo}).then(res => {
          console.log(res.body)
       },
        res => {
          console.error(res)
        }).finally(function () { 
          $('#addModal').modal('hide')
        });
    },
    
    addItem(selectProject, addItem_Title) {
      
      var obj = {
         text: addItem_Title,
        isCompleted: false
        }
      
      
       this.$http.post('/projects/'+ selectProject.id + '/todos', obj).then(res => {
          
         console.log(res.body)
           //alert("Данные успешно добавлены!")
            
            this.Projects[selectProject.id - 1].todos.push(res.body)
         
            },
        res => {
          console.error(res)
        }).finally(function () { 
          $('#addModal').modal('hide')
            });
   
    
    }
  },
  created() {
    this.getProjects()
  },
 })

