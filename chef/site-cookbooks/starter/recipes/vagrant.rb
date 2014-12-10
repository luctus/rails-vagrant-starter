include_recipe "rbenv::vagrant"

include_recipe "mysql::server"

package "libqt4-dev"
package "libicu48"
package "vim"
package "phantomjs"
