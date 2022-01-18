select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 233 and ss.ss_hash <= 633 and i.i_hash >= 148 and i.i_hash <= 898 and a.ca_hash >= 219 and a.ca_hash <= 552
;
