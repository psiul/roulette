select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 424 and ss.ss_hash <= 757 and hd.hd_hash >= 516 and hd.hd_hash <= 916 and cd.cd_hash >= 137 and cd.cd_hash <= 887
;
