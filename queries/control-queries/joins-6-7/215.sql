select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,customer c,household_demographics hd,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and i.i_hash >= 185 and i.i_hash <= 935 and hd.hd_hash >= 3 and hd.hd_hash <= 403 and d.d_hash >= 646 and d.d_hash <= 979
;
