select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,item i,household_demographics hd,customer c,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 84 and ss.ss_hash <= 417 and hd.hd_hash >= 210 and hd.hd_hash <= 960 and c.c_hash >= 195 and c.c_hash <= 595
;
