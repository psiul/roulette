select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 578 and ss.ss_hash <= 978 and cd.cd_hash >= 135 and cd.cd_hash <= 885 and a.ca_hash >= 531 and a.ca_hash <= 864
;
