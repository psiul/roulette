select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 154 and ss.ss_hash <= 487 and hd.hd_hash >= 148 and hd.hd_hash <= 548 and cd.cd_hash >= 159 and cd.cd_hash <= 909
;
