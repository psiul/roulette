select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_address a,customer_demographics cd,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and a.ca_hash >= 59 and a.ca_hash <= 809 and cd.cd_hash >= 508 and cd.cd_hash <= 841 and d.d_hash >= 120 and d.d_hash <= 520
;
