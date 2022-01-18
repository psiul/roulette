select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c,customer_address a,date_dim d,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 57 and ss.ss_hash <= 807 and i.i_hash >= 386 and i.i_hash <= 719 and a.ca_hash >= 257 and a.ca_hash <= 657
;
