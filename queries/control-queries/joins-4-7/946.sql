select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 228 and c.c_hash <= 628 and hd.hd_hash >= 96 and hd.hd_hash <= 846 and cd.cd_hash >= 263 and cd.cd_hash <= 596
;
