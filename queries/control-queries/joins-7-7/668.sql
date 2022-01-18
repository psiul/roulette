select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,date_dim d,customer_demographics cd,household_demographics hd,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 513 and ss.ss_hash <= 913 and c.c_hash >= 256 and c.c_hash <= 589 and cd.cd_hash >= 210 and cd.cd_hash <= 960
;
