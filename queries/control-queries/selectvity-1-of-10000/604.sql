select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 866 and ss.ss_hash <= 886 and i.i_hash >= 568 and i.i_hash <= 618 and hd.hd_hash >= 246 and hd.hd_hash <= 346
;
