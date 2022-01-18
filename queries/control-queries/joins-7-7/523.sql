select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,date_dim d,item i,customer_demographics cd,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 40 and ss.ss_hash <= 790 and d.d_hash >= 582 and d.d_hash <= 982 and a.ca_hash >= 82 and a.ca_hash <= 415
;
