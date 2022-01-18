select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,customer_address a,date_dim d,item i,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and a.ca_hash >= 198 and a.ca_hash <= 531 and d.d_hash >= 93 and d.d_hash <= 493 and i.i_hash >= 15 and i.i_hash <= 765
;
