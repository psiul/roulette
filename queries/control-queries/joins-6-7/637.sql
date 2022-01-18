select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,item i,date_dim d,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 94 and c.c_hash <= 844 and cd.cd_hash >= 333 and cd.cd_hash <= 666 and hd.hd_hash >= 230 and hd.hd_hash <= 630
;
