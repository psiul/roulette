select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 481 and c.c_hash <= 814 and hd.hd_hash >= 357 and hd.hd_hash <= 757 and cd.cd_hash >= 228 and cd.cd_hash <= 978
;
