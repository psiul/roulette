select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,household_demographics hd,customer c,customer_demographics cd,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 235 and ss.ss_hash <= 568 and d.d_hash >= 43 and d.d_hash <= 793 and hd.hd_hash >= 438 and hd.hd_hash <= 838
;
