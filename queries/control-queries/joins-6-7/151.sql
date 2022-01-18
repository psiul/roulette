select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,item i,date_dim d,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 608 and hd.hd_hash <= 941 and c.c_hash >= 464 and c.c_hash <= 864 and i.i_hash >= 36 and i.i_hash <= 786
;
