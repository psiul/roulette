select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd,date_dim d,customer_address a,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 510 and ss.ss_hash <= 843 and d.d_hash >= 162 and d.d_hash <= 562 and a.ca_hash >= 242 and a.ca_hash <= 992
;
