/* extend - 0.1.0
 * a teeny-tiny JavaScript namespacing script
 * https://github.com/searls/extend.js
 */
(function() {
  var makeExtender, originalExtend, preserveLeaf, resolveAncestors,
    __slice = [].slice;

  makeExtender = function(top) {
    return function() {
      var ancestors, leaf, name, parent, values, _ref;
      name = arguments[0], values = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
      ancestors = name.split(/[./\\]/g);
      leaf = ancestors.pop();
      parent = resolveAncestors(ancestors, top);
      if (preserveLeaf(parent[leaf])) {
        return (_ref = _(parent[leaf])).extend.apply(_ref, values);
      } else {
        return parent[leaf] = _.extend.apply(_, values);
      }
    };
  };

  resolveAncestors = function(ancestors, top) {
    return _(ancestors).reduce(function(ancestor, child) {
      return ancestor[child] || (ancestor[child] = {});
    }, top);
  };

  preserveLeaf = function(leaf) {
    return _(leaf).isFunction() || !_(leaf).isEmpty();
  };

  originalExtend = window.extend;

  window.extend = makeExtender(window);

  window.extend.myNamespace = function(namespace) {
    return namespace.extend = makeExtender(namespace);
  };

  window.extend.noConflict = function() {
    var ourExtend;
    ourExtend = window.extend;
    window.extend = originalExtend;
    return ourExtend;
  };

}).call(this);
