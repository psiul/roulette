select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_address a,item i,household_demographics hd,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 77 and c.c_hash <= 410 and a.ca_hash >= 591 and a.ca_hash <= 991 and hd.hd_hash >= 19 and hd.hd_hash <= 769
;
