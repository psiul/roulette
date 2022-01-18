select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 325 and ss.ss_hash <= 825 and i.i_hash >= 742 and i.i_hash <= 942
;
