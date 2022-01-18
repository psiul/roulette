select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,customer_demographics cd,household_demographics hd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and d.d_hash >= 495 and d.d_hash <= 828 and cd.cd_hash >= 389 and cd.cd_hash <= 789 and a.ca_hash >= 194 and a.ca_hash <= 944
;
