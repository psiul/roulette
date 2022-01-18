select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 174 and ss.ss_hash <= 924 and c.c_hash >= 535 and c.c_hash <= 935 and cd.cd_hash >= 268 and cd.cd_hash <= 601
;
