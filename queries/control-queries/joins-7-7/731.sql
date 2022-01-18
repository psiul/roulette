select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,item i,date_dim d,customer c,customer_address a
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and hd.hd_hash >= 166 and hd.hd_hash <= 566 and c.c_hash >= 504 and c.c_hash <= 837 and a.ca_hash >= 26 and a.ca_hash <= 776
;
