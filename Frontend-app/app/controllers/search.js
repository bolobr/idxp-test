import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    search: function(){
      console.log(this.get('search_box'))
      var url = "http://localhost:3000/api/v1/search_term/" + this.get('search_box');
      var that = this;
      $.ajax(url).then(function(result){
        console.log(result)
        var sorted_result = result.files.sort(function(a,b){
          return a.word_count < b.word_count
        })
        that.set('model', sorted_result);
      })
      // this.set('model', model);
    }
  }
});
