select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,date_dim d,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 322 and ss.ss_hash <= 722 and c.c_hash >= 315 and c.c_hash <= 648 and a.ca_hash >= 236 and a.ca_hash <= 986
;
