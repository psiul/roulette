select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_address a,household_demographics hd,item i,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and a.ca_hash >= 37 and a.ca_hash <= 370 and hd.hd_hash >= 545 and hd.hd_hash <= 945 and cd.cd_hash >= 154 and cd.cd_hash <= 904
;
