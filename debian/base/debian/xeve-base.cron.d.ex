#
# Regular cron jobs for the xeve-base package
#
0 4	* * *	root	[ -x /usr/bin/xeve-base_maintenance ] && /usr/bin/xeve-base_maintenance
