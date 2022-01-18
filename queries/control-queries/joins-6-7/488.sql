select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer_demographics cd,date_dim d,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and i.i_hash >= 332 and i.i_hash <= 665 and hd.hd_hash >= 245 and hd.hd_hash <= 995 and c.c_hash >= 160 and c.c_hash <= 560
;
