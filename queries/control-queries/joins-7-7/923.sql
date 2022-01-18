select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,date_dim d,household_demographics hd,customer c,customer_address a
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 140 and ss.ss_hash <= 890 and d.d_hash >= 36 and d.d_hash <= 436 and hd.hd_hash >= 58 and hd.hd_hash <= 391
;
