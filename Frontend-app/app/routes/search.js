import Ember from 'ember';

export default Ember.Route.extend({
  model: function(){
    return [{file_name: "teste", word_count: 1}];
  },

});
