select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,household_demographics hd,customer c,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and cd.cd_hash >= 568 and cd.cd_hash <= 901 and d.d_hash >= 13 and d.d_hash <= 763 and hd.hd_hash >= 573 and hd.hd_hash <= 973
;
