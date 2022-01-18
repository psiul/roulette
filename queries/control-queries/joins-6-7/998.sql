select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,item i,date_dim d,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 333 and ss.ss_hash <= 666 and hd.hd_hash >= 53 and hd.hd_hash <= 803 and i.i_hash >= 533 and i.i_hash <= 933
;
