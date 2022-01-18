select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer c,customer_demographics cd,customer_address a,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and hd.hd_hash >= 233 and hd.hd_hash <= 566 and c.c_hash >= 81 and c.c_hash <= 831 and a.ca_hash >= 228 and a.ca_hash <= 628
;
