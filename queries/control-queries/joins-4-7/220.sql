select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and hd.hd_hash >= 422 and hd.hd_hash <= 755 and cd.cd_hash >= 164 and cd.cd_hash <= 564 and i.i_hash >= 238 and i.i_hash <= 988
;
