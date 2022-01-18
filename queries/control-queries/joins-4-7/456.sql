select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 217 and i.i_hash <= 967 and cd.cd_hash >= 632 and cd.cd_hash <= 965 and hd.hd_hash >= 172 and hd.hd_hash <= 572
;
