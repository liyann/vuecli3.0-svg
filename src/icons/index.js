const requireAll = requireContext => {
  return requireContext.keys().map(requireContext);
};
const req = require.context("./svg", false, /\.svg$/);
/**
 * import all svg files
 */
requireAll(req);
