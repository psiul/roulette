select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd,date_dim d,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 483 and ss.ss_hash <= 883 and d.d_hash >= 20 and d.d_hash <= 770 and a.ca_hash >= 197 and a.ca_hash <= 530
;
