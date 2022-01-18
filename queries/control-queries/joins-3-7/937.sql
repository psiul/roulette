select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 201 and ss.ss_hash <= 534 and hd.hd_hash >= 513 and hd.hd_hash <= 913 and cd.cd_hash >= 22 and cd.cd_hash <= 772
;
