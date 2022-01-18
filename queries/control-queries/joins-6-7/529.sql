select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,item i,customer c,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 138 and hd.hd_hash <= 888 and c.c_hash >= 108 and c.c_hash <= 441 and cd.cd_hash >= 181 and cd.cd_hash <= 581
;
