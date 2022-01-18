select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,customer c,customer_address a,household_demographics hd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 510 and ss.ss_hash <= 843 and hd.hd_hash >= 23 and hd.hd_hash <= 773 and d.d_hash >= 44 and d.d_hash <= 444
;
