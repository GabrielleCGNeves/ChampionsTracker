/**
 * Serialize a non-plain old JavaScript object (POJO) using structured clone algorithm.
 *
 * @param {any} obj - The object to be serialized.
 * @return {any} Returns the serialized object.
 */
export const serializeNonPOJOs = (obj) => {
    return structuredClone(obj)
};