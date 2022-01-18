select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,date_dim d,customer_address a,household_demographics hd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 547 and ss.ss_hash <= 947 and c.c_hash >= 233 and c.c_hash <= 566 and d.d_hash >= 176 and d.d_hash <= 926
;
