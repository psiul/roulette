select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,customer c,customer_address a,household_demographics hd,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 32 and c.c_hash <= 432 and a.ca_hash >= 226 and a.ca_hash <= 976 and hd.hd_hash >= 289 and hd.hd_hash <= 622
;
