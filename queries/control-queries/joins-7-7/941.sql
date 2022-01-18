select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,household_demographics hd,customer c,customer_demographics cd,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 150 and ss.ss_hash <= 900 and i.i_hash >= 18 and i.i_hash <= 351 and a.ca_hash >= 356 and a.ca_hash <= 756
;
