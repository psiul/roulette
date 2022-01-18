select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 402 and ss.ss_hash <= 735 and c.c_hash >= 192 and c.c_hash <= 942 and cd.cd_hash >= 144 and cd.cd_hash <= 544
;
