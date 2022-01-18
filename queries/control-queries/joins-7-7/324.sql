select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer c,date_dim d,customer_address a,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 116 and c.c_hash <= 866 and d.d_hash >= 580 and d.d_hash <= 913 and a.ca_hash >= 252 and a.ca_hash <= 652
;
