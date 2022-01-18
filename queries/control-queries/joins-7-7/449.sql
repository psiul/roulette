select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer c,item i,customer_address a,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 63 and d.d_hash <= 396 and c.c_hash >= 523 and c.c_hash <= 923 and a.ca_hash >= 216 and a.ca_hash <= 966
;
