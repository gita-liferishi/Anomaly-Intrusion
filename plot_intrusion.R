#analysis of dst host server rates with respect to server count

g <- ggplot(intr, aes(dst_host_srv_count,dst_host_same_srv_rate, fill = check))
g + geom_point() + theme_bw() + facet_grid(check~.)

g <- ggplot(intr, aes(dst_host_srv_count,dst_host_diff_srv_rate, fill = check))
g + geom_point() + theme_bw() + facet_grid(check~.)
